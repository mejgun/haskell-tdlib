module TD.Data.EncryptedPassportElement
  (EncryptedPassportElement(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Data.ByteString as BS
import qualified TD.Data.DatedFile as DatedFile
import qualified Data.Text as T

data EncryptedPassportElement
  = EncryptedPassportElement -- ^ Contains information about an encrypted Telegram Passport element; for bots only
    { _type        :: Maybe PassportElementType.PassportElementType -- ^ Type of Telegram Passport element
    , _data        :: Maybe BS.ByteString                           -- ^ Encrypted JSON-encoded data about the user
    , front_side   :: Maybe DatedFile.DatedFile                     -- ^ The front side of an identity document
    , reverse_side :: Maybe DatedFile.DatedFile                     -- ^ The reverse side of an identity document; may be null
    , selfie       :: Maybe DatedFile.DatedFile                     -- ^ Selfie with the document; may be null
    , translation  :: Maybe [DatedFile.DatedFile]                   -- ^ List of files containing a certified English translation of the document
    , files        :: Maybe [DatedFile.DatedFile]                   -- ^ List of attached files
    , value        :: Maybe T.Text                                  -- ^ Unencrypted data, phone number or email address
    , hash         :: Maybe T.Text                                  -- ^ Hash of the entire element
    }
  deriving (Eq, Show)

instance I.ShortShow EncryptedPassportElement where
  shortShow EncryptedPassportElement
    { _type        = _type_
    , _data        = _data_
    , front_side   = front_side_
    , reverse_side = reverse_side_
    , selfie       = selfie_
    , translation  = translation_
    , files        = files_
    , value        = value_
    , hash         = hash_
    }
      = "EncryptedPassportElement"
        ++ I.cc
        [ "_type"        `I.p` _type_
        , "_data"        `I.p` _data_
        , "front_side"   `I.p` front_side_
        , "reverse_side" `I.p` reverse_side_
        , "selfie"       `I.p` selfie_
        , "translation"  `I.p` translation_
        , "files"        `I.p` files_
        , "value"        `I.p` value_
        , "hash"         `I.p` hash_
        ]

instance AT.FromJSON EncryptedPassportElement where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "encryptedPassportElement" -> parseEncryptedPassportElement v
      _                          -> mempty
    
    where
      parseEncryptedPassportElement :: A.Value -> AT.Parser EncryptedPassportElement
      parseEncryptedPassportElement = A.withObject "EncryptedPassportElement" $ \o -> do
        _type_        <- o A..:?                       "type"
        _data_        <- fmap I.readBytes <$> o A..:?  "data"
        front_side_   <- o A..:?                       "front_side"
        reverse_side_ <- o A..:?                       "reverse_side"
        selfie_       <- o A..:?                       "selfie"
        translation_  <- o A..:?                       "translation"
        files_        <- o A..:?                       "files"
        value_        <- o A..:?                       "value"
        hash_         <- o A..:?                       "hash"
        pure $ EncryptedPassportElement
          { _type        = _type_
          , _data        = _data_
          , front_side   = front_side_
          , reverse_side = reverse_side_
          , selfie       = selfie_
          , translation  = translation_
          , files        = files_
          , value        = value_
          , hash         = hash_
          }
  parseJSON _ = mempty

