{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EncryptedPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.DatedFile as DatedFile
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Utils as U

-- |
data EncryptedPassportElement = -- | Contains information about an encrypted Telegram Passport element; for bots only
  EncryptedPassportElement
  { -- | Hash of the entire element
    hash :: Maybe String,
    -- | Unencrypted data, phone number or email address
    value :: Maybe String,
    -- | List of attached files
    files :: Maybe [DatedFile.DatedFile],
    -- | List of files containing a certified English translation of the document
    translation :: Maybe [DatedFile.DatedFile],
    -- | Selfie with the document; may be null
    selfie :: Maybe DatedFile.DatedFile,
    -- | The reverse side of an identity document; may be null
    reverse_side :: Maybe DatedFile.DatedFile,
    -- | The front side of an identity document
    front_side :: Maybe DatedFile.DatedFile,
    -- | Encrypted JSON-encoded data about the user
    _data :: Maybe String,
    -- | Type of Telegram Passport element
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show EncryptedPassportElement where
  show
    EncryptedPassportElement
      { hash = hash_,
        value = value_,
        files = files_,
        translation = translation_,
        selfie = selfie_,
        reverse_side = reverse_side_,
        front_side = front_side_,
        _data = _data_,
        _type = _type_
      } =
      "EncryptedPassportElement"
        ++ U.cc
          [ U.p "hash" hash_,
            U.p "value" value_,
            U.p "files" files_,
            U.p "translation" translation_,
            U.p "selfie" selfie_,
            U.p "reverse_side" reverse_side_,
            U.p "front_side" front_side_,
            U.p "_data" _data_,
            U.p "_type" _type_
          ]

instance T.FromJSON EncryptedPassportElement where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "encryptedPassportElement" -> parseEncryptedPassportElement v
      _ -> mempty
    where
      parseEncryptedPassportElement :: A.Value -> T.Parser EncryptedPassportElement
      parseEncryptedPassportElement = A.withObject "EncryptedPassportElement" $ \o -> do
        hash_ <- o A..:? "hash"
        value_ <- o A..:? "value"
        files_ <- o A..:? "files"
        translation_ <- o A..:? "translation"
        selfie_ <- o A..:? "selfie"
        reverse_side_ <- o A..:? "reverse_side"
        front_side_ <- o A..:? "front_side"
        _data_ <- o A..:? "data"
        _type_ <- o A..:? "type"
        return $ EncryptedPassportElement {hash = hash_, value = value_, files = files_, translation = translation_, selfie = selfie_, reverse_side = reverse_side_, front_side = front_side_, _data = _data_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON EncryptedPassportElement where
  toJSON
    EncryptedPassportElement
      { hash = hash_,
        value = value_,
        files = files_,
        translation = translation_,
        selfie = selfie_,
        reverse_side = reverse_side_,
        front_side = front_side_,
        _data = _data_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "encryptedPassportElement",
          "hash" A..= hash_,
          "value" A..= value_,
          "files" A..= files_,
          "translation" A..= translation_,
          "selfie" A..= selfie_,
          "reverse_side" A..= reverse_side_,
          "front_side" A..= front_side_,
          "data" A..= _data_,
          "type" A..= _type_
        ]
