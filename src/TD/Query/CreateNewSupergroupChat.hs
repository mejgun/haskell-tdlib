module TD.Query.CreateNewSupergroupChat
  (CreateNewSupergroupChat(..)
  , defaultCreateNewSupergroupChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatLocation as ChatLocation

-- | Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat. Returns 'TD.Data.Chat.Chat'
data CreateNewSupergroupChat
  = CreateNewSupergroupChat
    { title                    :: Maybe T.Text                    -- ^ Title of the new chat; 1-128 characters
    , is_forum                 :: Maybe Bool                      -- ^ Pass true to create a forum supergroup chat
    , is_channel               :: Maybe Bool                      -- ^ Pass true to create a channel chat; ignored if a forum is created
    , description              :: Maybe T.Text                    -- ^ Chat description; 0-255 characters
    , location                 :: Maybe ChatLocation.ChatLocation -- ^ Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
    , message_auto_delete_time :: Maybe Int                       -- ^ Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    , for_import               :: Maybe Bool                      -- ^ Pass true to create a supergroup for importing messages using importMessages
    }
  deriving (Eq, Show)

instance I.ShortShow CreateNewSupergroupChat where
  shortShow
    CreateNewSupergroupChat
      { title                    = title_
      , is_forum                 = is_forum_
      , is_channel               = is_channel_
      , description              = description_
      , location                 = location_
      , message_auto_delete_time = message_auto_delete_time_
      , for_import               = for_import_
      }
        = "CreateNewSupergroupChat"
          ++ I.cc
          [ "title"                    `I.p` title_
          , "is_forum"                 `I.p` is_forum_
          , "is_channel"               `I.p` is_channel_
          , "description"              `I.p` description_
          , "location"                 `I.p` location_
          , "message_auto_delete_time" `I.p` message_auto_delete_time_
          , "for_import"               `I.p` for_import_
          ]

instance AT.ToJSON CreateNewSupergroupChat where
  toJSON
    CreateNewSupergroupChat
      { title                    = title_
      , is_forum                 = is_forum_
      , is_channel               = is_channel_
      , description              = description_
      , location                 = location_
      , message_auto_delete_time = message_auto_delete_time_
      , for_import               = for_import_
      }
        = A.object
          [ "@type"                    A..= AT.String "createNewSupergroupChat"
          , "title"                    A..= title_
          , "is_forum"                 A..= is_forum_
          , "is_channel"               A..= is_channel_
          , "description"              A..= description_
          , "location"                 A..= location_
          , "message_auto_delete_time" A..= message_auto_delete_time_
          , "for_import"               A..= for_import_
          ]

defaultCreateNewSupergroupChat :: CreateNewSupergroupChat
defaultCreateNewSupergroupChat =
  CreateNewSupergroupChat
    { title                    = Nothing
    , is_forum                 = Nothing
    , is_channel               = Nothing
    , description              = Nothing
    , location                 = Nothing
    , message_auto_delete_time = Nothing
    , for_import               = Nothing
    }

