module TD.Query.AddChecklistTasks
  (AddChecklistTasks(..)
  , defaultAddChecklistTasks
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChecklistTask as InputChecklistTask

-- | Adds tasks to a checklist in a message. Returns 'TD.Data.Ok.Ok'
data AddChecklistTasks
  = AddChecklistTasks
    { chat_id    :: Maybe Int                                     -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int                                     -- ^ Identifier of the message containing the checklist. Use messageProperties.can_add_tasks to check whether the tasks can be added
    , tasks      :: Maybe [InputChecklistTask.InputChecklistTask] -- ^ List of added tasks
    }
  deriving (Eq, Show)

instance I.ShortShow AddChecklistTasks where
  shortShow
    AddChecklistTasks
      { chat_id    = chat_id_
      , message_id = message_id_
      , tasks      = tasks_
      }
        = "AddChecklistTasks"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "tasks"      `I.p` tasks_
          ]

instance AT.ToJSON AddChecklistTasks where
  toJSON
    AddChecklistTasks
      { chat_id    = chat_id_
      , message_id = message_id_
      , tasks      = tasks_
      }
        = A.object
          [ "@type"      A..= AT.String "addChecklistTasks"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "tasks"      A..= tasks_
          ]

defaultAddChecklistTasks :: AddChecklistTasks
defaultAddChecklistTasks =
  AddChecklistTasks
    { chat_id    = Nothing
    , message_id = Nothing
    , tasks      = Nothing
    }

