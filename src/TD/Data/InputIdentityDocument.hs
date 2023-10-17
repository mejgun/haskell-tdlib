module TD.Data.InputIdentityDocument
  ( InputIdentityDocument(..)    
  , defaultInputIdentityDocument 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Date as Date
import qualified TD.Data.InputFile as InputFile

data InputIdentityDocument
  = InputIdentityDocument -- ^ An identity document to be saved to Telegram Passport
    { number          :: Maybe T.Text                -- ^ Document number; 1-24 characters
    , expiration_date :: Maybe Date.Date             -- ^ Document expiration date; pass null if not applicable
    , front_side      :: Maybe InputFile.InputFile   -- ^ Front side of the document
    , reverse_side    :: Maybe InputFile.InputFile   -- ^ Reverse side of the document; only for driver license and identity card; pass null otherwise
    , selfie          :: Maybe InputFile.InputFile   -- ^ Selfie with the document; pass null if unavailable
    , translation     :: Maybe [InputFile.InputFile] -- ^ List of files containing a certified English translation of the document
    }
  deriving (Eq, Show)

instance I.ShortShow InputIdentityDocument where
  shortShow InputIdentityDocument
    { number          = number_
    , expiration_date = expiration_date_
    , front_side      = front_side_
    , reverse_side    = reverse_side_
    , selfie          = selfie_
    , translation     = translation_
    }
      = "InputIdentityDocument"
        ++ I.cc
        [ "number"          `I.p` number_
        , "expiration_date" `I.p` expiration_date_
        , "front_side"      `I.p` front_side_
        , "reverse_side"    `I.p` reverse_side_
        , "selfie"          `I.p` selfie_
        , "translation"     `I.p` translation_
        ]

instance AT.FromJSON InputIdentityDocument where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputIdentityDocument" -> parseInputIdentityDocument v
      _                       -> mempty
    
    where
      parseInputIdentityDocument :: A.Value -> AT.Parser InputIdentityDocument
      parseInputIdentityDocument = A.withObject "InputIdentityDocument" $ \o -> do
        number_          <- o A..:?  "number"
        expiration_date_ <- o A..:?  "expiration_date"
        front_side_      <- o A..:?  "front_side"
        reverse_side_    <- o A..:?  "reverse_side"
        selfie_          <- o A..:?  "selfie"
        translation_     <- o A..:?  "translation"
        pure $ InputIdentityDocument
          { number          = number_
          , expiration_date = expiration_date_
          , front_side      = front_side_
          , reverse_side    = reverse_side_
          , selfie          = selfie_
          , translation     = translation_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputIdentityDocument where
  toJSON InputIdentityDocument
    { number          = number_
    , expiration_date = expiration_date_
    , front_side      = front_side_
    , reverse_side    = reverse_side_
    , selfie          = selfie_
    , translation     = translation_
    }
      = A.object
        [ "@type"           A..= AT.String "inputIdentityDocument"
        , "number"          A..= number_
        , "expiration_date" A..= expiration_date_
        , "front_side"      A..= front_side_
        , "reverse_side"    A..= reverse_side_
        , "selfie"          A..= selfie_
        , "translation"     A..= translation_
        ]

defaultInputIdentityDocument :: InputIdentityDocument
defaultInputIdentityDocument =
  InputIdentityDocument
    { number          = Nothing
    , expiration_date = Nothing
    , front_side      = Nothing
    , reverse_side    = Nothing
    , selfie          = Nothing
    , translation     = Nothing
    }

