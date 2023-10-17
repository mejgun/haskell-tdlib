module TD.Data.IdentityDocument
  (IdentityDocument(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Date as Date
import qualified TD.Data.DatedFile as DatedFile

data IdentityDocument
  = IdentityDocument -- ^ An identity document
    { number          :: Maybe T.Text                -- ^ Document number; 1-24 characters
    , expiration_date :: Maybe Date.Date             -- ^ Document expiration date; may be null if not applicable
    , front_side      :: Maybe DatedFile.DatedFile   -- ^ Front side of the document
    , reverse_side    :: Maybe DatedFile.DatedFile   -- ^ Reverse side of the document; only for driver license and identity card; may be null
    , selfie          :: Maybe DatedFile.DatedFile   -- ^ Selfie with the document; may be null
    , translation     :: Maybe [DatedFile.DatedFile] -- ^ List of files containing a certified English translation of the document
    }
  deriving (Eq, Show)

instance I.ShortShow IdentityDocument where
  shortShow IdentityDocument
    { number          = number_
    , expiration_date = expiration_date_
    , front_side      = front_side_
    , reverse_side    = reverse_side_
    , selfie          = selfie_
    , translation     = translation_
    }
      = "IdentityDocument"
        ++ I.cc
        [ "number"          `I.p` number_
        , "expiration_date" `I.p` expiration_date_
        , "front_side"      `I.p` front_side_
        , "reverse_side"    `I.p` reverse_side_
        , "selfie"          `I.p` selfie_
        , "translation"     `I.p` translation_
        ]

instance AT.FromJSON IdentityDocument where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "identityDocument" -> parseIdentityDocument v
      _                  -> mempty
    
    where
      parseIdentityDocument :: A.Value -> AT.Parser IdentityDocument
      parseIdentityDocument = A.withObject "IdentityDocument" $ \o -> do
        number_          <- o A..:?  "number"
        expiration_date_ <- o A..:?  "expiration_date"
        front_side_      <- o A..:?  "front_side"
        reverse_side_    <- o A..:?  "reverse_side"
        selfie_          <- o A..:?  "selfie"
        translation_     <- o A..:?  "translation"
        pure $ IdentityDocument
          { number          = number_
          , expiration_date = expiration_date_
          , front_side      = front_side_
          , reverse_side    = reverse_side_
          , selfie          = selfie_
          , translation     = translation_
          }
  parseJSON _ = mempty

