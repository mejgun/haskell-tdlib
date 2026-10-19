module TD.Query.CreateBot
  (CreateBot(..)
  , defaultCreateBot
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a bot which will be managed by another bot. Returns the created bot. May return an error with a message "BOT_CREATE_LIMIT_EXCEEDED" if the user already owns the maximum allowed number of bots as per getOption("owned_bot_count_max"). An internal link "https://t.me/BotFather?start=deletebot" can be processed to handle the error. Returns 'TD.Data.User.User'
data CreateBot
  = CreateBot
    { manager_bot_user_id :: Maybe Int    -- ^ Identifier of the bot that will manage the created bot
    , name                :: Maybe T.Text -- ^ Name of the bot; 1-64 characters
    , username            :: Maybe T.Text -- ^ Username of the bot. The username must end with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive. Use checkBotUsername to find whether the name is suitable. If the username doesn't end with "bot", then the current user must have Telegram Premium subscription, the chosen username will be assigned as secondary and an additional regular username ending with "bot" will be automatically assigned to the created bot
    , via_link            :: Maybe Bool   -- ^ Pass true if the bot is created from an internalLinkTypeRequestManagedBot link
    }
  deriving (Eq, Show)

instance I.ShortShow CreateBot where
  shortShow
    CreateBot
      { manager_bot_user_id = manager_bot_user_id_
      , name                = name_
      , username            = username_
      , via_link            = via_link_
      }
        = "CreateBot"
          ++ I.cc
          [ "manager_bot_user_id" `I.p` manager_bot_user_id_
          , "name"                `I.p` name_
          , "username"            `I.p` username_
          , "via_link"            `I.p` via_link_
          ]

instance AT.ToJSON CreateBot where
  toJSON
    CreateBot
      { manager_bot_user_id = manager_bot_user_id_
      , name                = name_
      , username            = username_
      , via_link            = via_link_
      }
        = A.object
          [ "@type"               A..= AT.String "createBot"
          , "manager_bot_user_id" A..= manager_bot_user_id_
          , "name"                A..= name_
          , "username"            A..= username_
          , "via_link"            A..= via_link_
          ]

defaultCreateBot :: CreateBot
defaultCreateBot =
  CreateBot
    { manager_bot_user_id = Nothing
    , name                = Nothing
    , username            = Nothing
    , via_link            = Nothing
    }

