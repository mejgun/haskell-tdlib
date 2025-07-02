module TD.Query.MarkChecklistTasksAsDone
  (MarkChecklistTasksAsDone(..)
  , defaultMarkChecklistTasksAsDone
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds tasks of a checklist in a message as done or not done. Returns 'TD.Data.Ok.Ok'
data MarkChecklistTasksAsDone
  = MarkChecklistTasksAsDone
    { chat_id                     :: Maybe Int   -- ^ Identifier of the chat with the message
    , message_id                  :: Maybe Int   -- ^ Identifier of the message containing the checklist. Use messageProperties.can_mark_tasks_as_done to check whether the tasks can be marked as done or not done
    , marked_as_done_task_ids     :: Maybe [Int] -- ^ Identifiers of tasks that were marked as done
    , marked_as_not_done_task_ids :: Maybe [Int] -- ^ Identifiers of tasks that were marked as not done
    }
  deriving (Eq, Show)

instance I.ShortShow MarkChecklistTasksAsDone where
  shortShow
    MarkChecklistTasksAsDone
      { chat_id                     = chat_id_
      , message_id                  = message_id_
      , marked_as_done_task_ids     = marked_as_done_task_ids_
      , marked_as_not_done_task_ids = marked_as_not_done_task_ids_
      }
        = "MarkChecklistTasksAsDone"
          ++ I.cc
          [ "chat_id"                     `I.p` chat_id_
          , "message_id"                  `I.p` message_id_
          , "marked_as_done_task_ids"     `I.p` marked_as_done_task_ids_
          , "marked_as_not_done_task_ids" `I.p` marked_as_not_done_task_ids_
          ]

instance AT.ToJSON MarkChecklistTasksAsDone where
  toJSON
    MarkChecklistTasksAsDone
      { chat_id                     = chat_id_
      , message_id                  = message_id_
      , marked_as_done_task_ids     = marked_as_done_task_ids_
      , marked_as_not_done_task_ids = marked_as_not_done_task_ids_
      }
        = A.object
          [ "@type"                       A..= AT.String "markChecklistTasksAsDone"
          , "chat_id"                     A..= chat_id_
          , "message_id"                  A..= message_id_
          , "marked_as_done_task_ids"     A..= marked_as_done_task_ids_
          , "marked_as_not_done_task_ids" A..= marked_as_not_done_task_ids_
          ]

defaultMarkChecklistTasksAsDone :: MarkChecklistTasksAsDone
defaultMarkChecklistTasksAsDone =
  MarkChecklistTasksAsDone
    { chat_id                     = Nothing
    , message_id                  = Nothing
    , marked_as_done_task_ids     = Nothing
    , marked_as_not_done_task_ids = Nothing
    }

