<!-- resources/views/partials/file.blade.php -->
<div class="form-group">
    <label for="{{ $id }}">{{ $name }}</label>
    <input type="file" class="form-control" id="{{ $id }}" name="{{ $id }}" accept="audio/mp3" {{ $required ? 'required' : '' }}>
</div>
