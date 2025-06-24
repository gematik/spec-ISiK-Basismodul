const { checkMustSupportDescriptions } = require('../qa-fhir');

// Hilfsfunktion für ein Minimal-Profil
function makeProfile(elements, description = 'desc') {
  return {
    description,
    differential: { element: elements }
  };
}

describe('checkMustSupportDescriptions', () => {
  it('warnt, wenn description fehlt', () => {
    const profile = makeProfile([]);
    profile.description = '';
    const result = checkMustSupportDescriptions(profile, 'test.json');
    expect(result.warnings).toContain('⚠️ test.json: StructureDefinition.description ist nicht ausgefüllt');
  });

  it('warnt, wenn keine differential.element vorhanden ist', () => {
    const profile = { description: 'desc', differential: {} };
    const result = checkMustSupportDescriptions(profile, 'test.json');
    expect(result.warnings[0]).toMatch(/hat keine Differential-Elemente/);
  });

  it('warnt, wenn mustSupport-Element kein short hat', () => {
    const el = { path: 'Patient.name', mustSupport: true, short: '', comment: 'c' };
    const profile = makeProfile([el]);
    const result = checkMustSupportDescriptions(profile, 'test.json');
    expect(result.warnings[0]).toMatch(/Fehlendes short/);
  });

  it('meldet Fehler, wenn mustSupport-Element kein comment hat', () => {
    const el = { path: 'Patient.name', mustSupport: true, short: 's', comment: '' };
    const profile = makeProfile([el]);
    const result = checkMustSupportDescriptions(profile, 'test.json');
    expect(result.errors[0]).toMatch(/Fehlendes comment/);
  });

  it('meldet Fehler, wenn Element mit max=0 mustSupport hat', () => {
    const el = { path: 'Patient.name', max: '0', mustSupport: true };
    const profile = makeProfile([el]);
    const result = checkMustSupportDescriptions(profile, 'test.json');
    expect(result.errors[0]).toMatch(/mit Kardinalität '0..0' sollte kein mustSupport-Attribut haben/);
  });

  it('meldet Fehler, wenn Kardinalität angepasst, aber kein mustSupport vorhanden ist', () => {
    const el = { path: 'Patient.name', min: 1, max: '1' };
    const profile = makeProfile([el]);
    const result = checkMustSupportDescriptions(profile, 'test.json');
    expect(result.errors[0]).toMatch(/hat kein mustSupport-Attribut/);
  });

  it('ignoriert unterdrückte Elemente', () => {
    const el = { path: 'Patient.name', mustSupport: true, short: '', comment: '' };
    const profile = makeProfile([el]);
    const result = checkMustSupportDescriptions(profile, 'test.json', ['Patient.name']);
    expect(result.errors.length).toBe(0);
    expect(result.warnings.length).toBe(0);
  });
});