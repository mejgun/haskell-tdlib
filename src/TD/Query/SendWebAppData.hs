module TD.Query.SendWebAppData where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SendWebAppData -- ^ Sends data received from a keyboardButtonTypeWebApp Web App to a bot
  = SendWebAppData
    { bot_user_id :: Maybe Int    -- ^ Identifier of the target bot
    , button_text :: Maybe T.Text -- ^ Text of the keyboardButtonTypeWebApp button, which opened the Web App
    , _data       :: Maybe T.Text -- ^ The data
    }
  deriving (Eq)

instance Show SendWebAppData where
  show
    SendWebAppData
      { bot_user_id = bot_user_id_
      , button_text = button_text_
      , _data       = _data_
      }
        = "SendWebAppData"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "button_text" `I.p` button_text_
          , "_data"       `I.p` _data_
          ]

instance AT.ToJSON SendWebAppData where
  toJSON
    SendWebAppData
      { bot_user_id = bot_user_id_
      , button_text = button_text_
      , _data       = _data_
      }
        = A.object
          [ "@type"       A..= AT.String "sendWebAppData"
          , "bot_user_id" A..= bot_user_id_
          , "button_text" A..= button_text_
          , "data"        A..= _data_
          ]
