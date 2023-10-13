module TD.Data.SavedCredentials (SavedCredentials(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SavedCredentials
  = SavedCredentials -- ^ Contains information about saved payment credentials
    { _id   :: Maybe T.Text -- ^ Unique identifier of the saved credentials
    , title :: Maybe T.Text -- ^ Title of the saved credentials
    }
  deriving (Eq)

instance Show SavedCredentials where
  show SavedCredentials
    { _id   = _id_
    , title = title_
    }
      = "SavedCredentials"
        ++ I.cc
        [ "_id"   `I.p` _id_
        , "title" `I.p` title_
        ]

instance AT.FromJSON SavedCredentials where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "savedCredentials" -> parseSavedCredentials v
      _                  -> mempty
    
    where
      parseSavedCredentials :: A.Value -> AT.Parser SavedCredentials
      parseSavedCredentials = A.withObject "SavedCredentials" $ \o -> do
        _id_   <- o A..:?  "id"
        title_ <- o A..:?  "title"
        pure $ SavedCredentials
          { _id   = _id_
          , title = title_
          }
  parseJSON _ = mempty

instance AT.ToJSON SavedCredentials where
  toJSON SavedCredentials
    { _id   = _id_
    , title = title_
    }
      = A.object
        [ "@type" A..= AT.String "savedCredentials"
        , "id"    A..= _id_
        , "title" A..= title_
        ]
