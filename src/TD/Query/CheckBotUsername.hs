module TD.Query.CheckBotUsername
  (CheckBotUsername(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks whether a username can be set for a new bot. Use checkChatUsername to check username for other chat types. Returns 'TD.Data.CheckChatUsernameResult.CheckChatUsernameResult'
data CheckBotUsername
  = CheckBotUsername
    { username :: Maybe T.Text -- ^ Username to be checked
    }
  deriving (Eq, Show)

instance I.ShortShow CheckBotUsername where
  shortShow
    CheckBotUsername
      { username = username_
      }
        = "CheckBotUsername"
          ++ I.cc
          [ "username" `I.p` username_
          ]

instance AT.ToJSON CheckBotUsername where
  toJSON
    CheckBotUsername
      { username = username_
      }
        = A.object
          [ "@type"    A..= AT.String "checkBotUsername"
          , "username" A..= username_
          ]

