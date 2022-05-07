{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.EncryptedPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.DatedFile as DatedFile
import qualified TD.Reply.PassportElementType as PassportElementType
import qualified Utils as U

data EncryptedPassportElement = -- | Contains information about an encrypted Telegram Passport element; for bots only @type Type of Telegram Passport element @data Encrypted JSON-encoded data about the user @front_side The front side of an identity document @reverse_side The reverse side of an identity document; may be null @selfie Selfie with the document; may be null @translation List of files containing a certified English translation of the document @files List of attached files @value Unencrypted data, phone number or email address @hash Hash of the entire element
  EncryptedPassportElement
  { -- |
    hash :: Maybe String,
    -- |
    value :: Maybe String,
    -- |
    files :: Maybe [DatedFile.DatedFile],
    -- |
    translation :: Maybe [DatedFile.DatedFile],
    -- |
    selfie :: Maybe DatedFile.DatedFile,
    -- |
    reverse_side :: Maybe DatedFile.DatedFile,
    -- |
    front_side :: Maybe DatedFile.DatedFile,
    -- |
    _data :: Maybe String,
    -- |
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show EncryptedPassportElement where
  show
    EncryptedPassportElement
      { hash = hash,
        value = value,
        files = files,
        translation = translation,
        selfie = selfie,
        reverse_side = reverse_side,
        front_side = front_side,
        _data = _data,
        _type = _type
      } =
      "EncryptedPassportElement"
        ++ U.cc
          [ U.p "hash" hash,
            U.p "value" value,
            U.p "files" files,
            U.p "translation" translation,
            U.p "selfie" selfie,
            U.p "reverse_side" reverse_side,
            U.p "front_side" front_side,
            U.p "_data" _data,
            U.p "_type" _type
          ]

instance T.FromJSON EncryptedPassportElement where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "encryptedPassportElement" -> parseEncryptedPassportElement v
      _ -> fail ""
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
  parseJSON _ = fail ""

instance T.ToJSON EncryptedPassportElement where
  toJSON
    EncryptedPassportElement
      { hash = hash,
        value = value,
        files = files,
        translation = translation,
        selfie = selfie,
        reverse_side = reverse_side,
        front_side = front_side,
        _data = _data,
        _type = _type
      } =
      A.object
        [ "@type" A..= T.String "encryptedPassportElement",
          "hash" A..= hash,
          "value" A..= value,
          "files" A..= files,
          "translation" A..= translation,
          "selfie" A..= selfie,
          "reverse_side" A..= reverse_side,
          "front_side" A..= front_side,
          "data" A..= _data,
          "type" A..= _type
        ]
