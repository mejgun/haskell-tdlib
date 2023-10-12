module TD.Query.CheckAuthenticationBotToken where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CheckAuthenticationBotToken -- ^ Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in
  = CheckAuthenticationBotToken
    { token :: Maybe T.Text -- ^ The bot token
    }
  deriving (Eq)

instance Show CheckAuthenticationBotToken where
  show
    CheckAuthenticationBotToken
      { token = token_
      }
        = "CheckAuthenticationBotToken"
          ++ I.cc
          [ "token" `I.p` token_
          ]

instance AT.ToJSON CheckAuthenticationBotToken where
  toJSON
    CheckAuthenticationBotToken
      { token = token_
      }
        = A.object
          [ "@type" A..= AT.String "checkAuthenticationBotToken"
          , "token" A..= token_
          ]
