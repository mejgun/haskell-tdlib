module TD.Data.CallbackQueryAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CallbackQueryAnswer
  = CallbackQueryAnswer -- ^ Contains a bot's answer to a callback query
    { text       :: Maybe T.Text -- ^ Text of the answer
    , show_alert :: Maybe Bool   -- ^ True, if an alert must be shown to the user instead of a toast notification
    , url        :: Maybe T.Text -- ^ URL to be opened
    }
  deriving (Eq)

instance Show CallbackQueryAnswer where
  show CallbackQueryAnswer
    { text       = text_
    , show_alert = show_alert_
    , url        = url_
    }
      = "CallbackQueryAnswer"
        ++ I.cc
        [ "text"       `I.p` text_
        , "show_alert" `I.p` show_alert_
        , "url"        `I.p` url_
        ]

instance AT.FromJSON CallbackQueryAnswer where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callbackQueryAnswer" -> parseCallbackQueryAnswer v
      _                     -> mempty
    
    where
      parseCallbackQueryAnswer :: A.Value -> AT.Parser CallbackQueryAnswer
      parseCallbackQueryAnswer = A.withObject "CallbackQueryAnswer" $ \o -> do
        text_       <- o A..:?  "text"
        show_alert_ <- o A..:?  "show_alert"
        url_        <- o A..:?  "url"
        pure $ CallbackQueryAnswer
          { text       = text_
          , show_alert = show_alert_
          , url        = url_
          }

instance AT.ToJSON CallbackQueryAnswer where
  toJSON CallbackQueryAnswer
    { text       = text_
    , show_alert = show_alert_
    , url        = url_
    }
      = A.object
        [ "@type"      A..= AT.String "callbackQueryAnswer"
        , "text"       A..= text_
        , "show_alert" A..= show_alert_
        , "url"        A..= url_
        ]
