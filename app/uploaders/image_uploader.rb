class ImageUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_extension_inclusion [/jpe?g/, "png"]
    validate_mime_type_inclusion ["image/jpeg", "image/png"]
  end
end
