module TD.Data.MessageViewer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data MessageViewer
  = MessageViewer -- ^ Represents a viewer of a message
    { user_id   :: Maybe Int -- ^ User identifier of the viewer
    , view_date :: Maybe Int -- ^ Approximate point in time (Unix timestamp) when the message was viewed
    }
  deriving (Eq)

instance Show MessageViewer where
  show MessageViewer
    { user_id   = user_id_
    , view_date = view_date_
    }
      = "MessageViewer"
        ++ I.cc
        [ "user_id"   `I.p` user_id_
        , "view_date" `I.p` view_date_
        ]

instance AT.FromJSON MessageViewer where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageViewer" -> parseMessageViewer v
      _               -> mempty
    
    where
      parseMessageViewer :: A.Value -> AT.Parser MessageViewer
      parseMessageViewer = A.withObject "MessageViewer" $ \o -> do
        user_id_   <- o A..:?  "user_id"
        view_date_ <- o A..:?  "view_date"
        pure $ MessageViewer
          { user_id   = user_id_
          , view_date = view_date_
          }

instance AT.ToJSON MessageViewer where
  toJSON MessageViewer
    { user_id   = user_id_
    , view_date = view_date_
    }
      = A.object
        [ "@type"     A..= AT.String "messageViewer"
        , "user_id"   A..= user_id_
        , "view_date" A..= view_date_
        ]
