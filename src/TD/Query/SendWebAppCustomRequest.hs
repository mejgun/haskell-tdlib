module TD.Query.SendWebAppCustomRequest
  (SendWebAppCustomRequest(..)
  , defaultSendWebAppCustomRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sends a custom request from a Web App. Returns 'TD.Data.CustomRequestResult.CustomRequestResult'
data SendWebAppCustomRequest
  = SendWebAppCustomRequest
    { bot_user_id :: Maybe Int    -- ^ Identifier of the bot
    , method      :: Maybe T.Text -- ^ The method name
    , parameters  :: Maybe T.Text -- ^ JSON-serialized method parameters
    }
  deriving (Eq, Show)

instance I.ShortShow SendWebAppCustomRequest where
  shortShow
    SendWebAppCustomRequest
      { bot_user_id = bot_user_id_
      , method      = method_
      , parameters  = parameters_
      }
        = "SendWebAppCustomRequest"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "method"      `I.p` method_
          , "parameters"  `I.p` parameters_
          ]

instance AT.ToJSON SendWebAppCustomRequest where
  toJSON
    SendWebAppCustomRequest
      { bot_user_id = bot_user_id_
      , method      = method_
      , parameters  = parameters_
      }
        = A.object
          [ "@type"       A..= AT.String "sendWebAppCustomRequest"
          , "bot_user_id" A..= bot_user_id_
          , "method"      A..= method_
          , "parameters"  A..= parameters_
          ]

defaultSendWebAppCustomRequest :: SendWebAppCustomRequest
defaultSendWebAppCustomRequest =
  SendWebAppCustomRequest
    { bot_user_id = Nothing
    , method      = Nothing
    , parameters  = Nothing
    }

