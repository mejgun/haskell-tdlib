module TD.Data.Checklist
  (Checklist(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.ChecklistTask as ChecklistTask

data Checklist
  = Checklist -- ^ Describes a checklist
    { title                         :: Maybe FormattedText.FormattedText   -- ^ Title of the checklist; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities
    , tasks                         :: Maybe [ChecklistTask.ChecklistTask] -- ^ List of tasks in the checklist
    , others_can_add_tasks          :: Maybe Bool                          -- ^ True, if users other than creator of the list can add tasks to the list
    , can_add_tasks                 :: Maybe Bool                          -- ^ True, if the current user can add tasks to the list if they have Telegram Premium subscription
    , others_can_mark_tasks_as_done :: Maybe Bool                          -- ^ True, if users other than creator of the list can mark tasks as done or not done. If true, then the checklist is called "group checklist"
    , can_mark_tasks_as_done        :: Maybe Bool                          -- ^ True, if the current user can mark tasks as done or not done if they have Telegram Premium subscription
    }
  deriving (Eq, Show)

instance I.ShortShow Checklist where
  shortShow Checklist
    { title                         = title_
    , tasks                         = tasks_
    , others_can_add_tasks          = others_can_add_tasks_
    , can_add_tasks                 = can_add_tasks_
    , others_can_mark_tasks_as_done = others_can_mark_tasks_as_done_
    , can_mark_tasks_as_done        = can_mark_tasks_as_done_
    }
      = "Checklist"
        ++ I.cc
        [ "title"                         `I.p` title_
        , "tasks"                         `I.p` tasks_
        , "others_can_add_tasks"          `I.p` others_can_add_tasks_
        , "can_add_tasks"                 `I.p` can_add_tasks_
        , "others_can_mark_tasks_as_done" `I.p` others_can_mark_tasks_as_done_
        , "can_mark_tasks_as_done"        `I.p` can_mark_tasks_as_done_
        ]

instance AT.FromJSON Checklist where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "checklist" -> parseChecklist v
      _           -> mempty
    
    where
      parseChecklist :: A.Value -> AT.Parser Checklist
      parseChecklist = A.withObject "Checklist" $ \o -> do
        title_                         <- o A..:?  "title"
        tasks_                         <- o A..:?  "tasks"
        others_can_add_tasks_          <- o A..:?  "others_can_add_tasks"
        can_add_tasks_                 <- o A..:?  "can_add_tasks"
        others_can_mark_tasks_as_done_ <- o A..:?  "others_can_mark_tasks_as_done"
        can_mark_tasks_as_done_        <- o A..:?  "can_mark_tasks_as_done"
        pure $ Checklist
          { title                         = title_
          , tasks                         = tasks_
          , others_can_add_tasks          = others_can_add_tasks_
          , can_add_tasks                 = can_add_tasks_
          , others_can_mark_tasks_as_done = others_can_mark_tasks_as_done_
          , can_mark_tasks_as_done        = can_mark_tasks_as_done_
          }
  parseJSON _ = mempty

