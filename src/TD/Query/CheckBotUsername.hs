module TD.Query.CheckBotUsername
  (CheckBotUsername(..)
  , defaultCheckBotUsername
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks whether a username can be set for a new bot or assigned as a secondary username to an existing bot. Use checkChatUsername to check username for other chat types. Returns 'TD.Data.CheckChatUsernameResult.CheckChatUsernameResult'
data CheckBotUsername
  = CheckBotUsername
    { username     :: Maybe T.Text -- ^ Username to be checked
    , is_secondary :: Maybe Bool   -- ^ Pass true to check whether the username is suitable as a secondary username for an existing bot; pass false to check whether the username is suitable for createBot
    }
  deriving (Eq, Show)

instance I.ShortShow CheckBotUsername where
  shortShow
    CheckBotUsername
      { username     = username_
      , is_secondary = is_secondary_
      }
        = "CheckBotUsername"
          ++ I.cc
          [ "username"     `I.p` username_
          , "is_secondary" `I.p` is_secondary_
          ]

instance AT.ToJSON CheckBotUsername where
  toJSON
    CheckBotUsername
      { username     = username_
      , is_secondary = is_secondary_
      }
        = A.object
          [ "@type"        A..= AT.String "checkBotUsername"
          , "username"     A..= username_
          , "is_secondary" A..= is_secondary_
          ]

defaultCheckBotUsername :: CheckBotUsername
defaultCheckBotUsername =
  CheckBotUsername
    { username     = Nothing
    , is_secondary = Nothing
    }

