
export default function ExpandVars(template, values) {
  for (var name in values) {
    template = template.replace(
      '{' + name + '}',
      values[name]
    );
  }
  return template;
}
