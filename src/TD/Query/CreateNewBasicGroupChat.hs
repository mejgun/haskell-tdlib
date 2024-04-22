module TD.Query.CreateNewBasicGroupChat
  (CreateNewBasicGroupChat(..)
  , defaultCreateNewBasicGroupChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns information about the newly created chat. Returns 'TD.Data.CreatedBasicGroupChat.CreatedBasicGroupChat'
data CreateNewBasicGroupChat
  = CreateNewBasicGroupChat
    { user_ids                 :: Maybe [Int]  -- ^ Identifiers of users to be added to the basic group; may be empty to create a basic group without other members
    , title                    :: Maybe T.Text -- ^ Title of the new basic group; 1-128 characters
    , message_auto_delete_time :: Maybe Int    -- ^ Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    }
  deriving (Eq, Show)

instance I.ShortShow CreateNewBasicGroupChat where
  shortShow
    CreateNewBasicGroupChat
      { user_ids                 = user_ids_
      , title                    = title_
      , message_auto_delete_time = message_auto_delete_time_
      }
        = "CreateNewBasicGroupChat"
          ++ I.cc
          [ "user_ids"                 `I.p` user_ids_
          , "title"                    `I.p` title_
          , "message_auto_delete_time" `I.p` message_auto_delete_time_
          ]

instance AT.ToJSON CreateNewBasicGroupChat where
  toJSON
    CreateNewBasicGroupChat
      { user_ids                 = user_ids_
      , title                    = title_
      , message_auto_delete_time = message_auto_delete_time_
      }
        = A.object
          [ "@type"                    A..= AT.String "createNewBasicGroupChat"
          , "user_ids"                 A..= user_ids_
          , "title"                    A..= title_
          , "message_auto_delete_time" A..= message_auto_delete_time_
          ]

defaultCreateNewBasicGroupChat :: CreateNewBasicGroupChat
defaultCreateNewBasicGroupChat =
  CreateNewBasicGroupChat
    { user_ids                 = Nothing
    , title                    = Nothing
    , message_auto_delete_time = Nothing
    }

