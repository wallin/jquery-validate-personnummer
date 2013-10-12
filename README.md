# jQuery validate plugin for Swedish SSN

This is a plugin for [jQuery validate](https://github.com/jzaefferer/jquery-validation)
that validates a [swedish SSN](http://en.wikipedia.org/wiki/National_identification_number) (personnummer)

## Example

```html
<form method="POST" action="/action">
  <input type="text" class="personnummer required">
  <input type="submit" value="Submit">
</form>
<script>
$("form").validate();
</script>
```