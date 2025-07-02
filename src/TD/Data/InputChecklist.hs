module TD.Data.InputChecklist
  ( InputChecklist(..)    
  , defaultInputChecklist 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.InputChecklistTask as InputChecklistTask

data InputChecklist
  = InputChecklist -- ^ Describes a checklist to be sent
    { title                         :: Maybe FormattedText.FormattedText             -- ^ Title of the checklist; 1-getOption("checklist_title_length_max") characters. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities
    , tasks                         :: Maybe [InputChecklistTask.InputChecklistTask] -- ^ List of tasks in the checklist; 1-getOption("checklist_task_count_max") tasks
    , others_can_add_tasks          :: Maybe Bool                                    -- ^ True, if other users can add tasks to the list
    , others_can_mark_tasks_as_done :: Maybe Bool                                    -- ^ True, if other users can mark tasks as done or not done
    }
  deriving (Eq, Show)

instance I.ShortShow InputChecklist where
  shortShow InputChecklist
    { title                         = title_
    , tasks                         = tasks_
    , others_can_add_tasks          = others_can_add_tasks_
    , others_can_mark_tasks_as_done = others_can_mark_tasks_as_done_
    }
      = "InputChecklist"
        ++ I.cc
        [ "title"                         `I.p` title_
        , "tasks"                         `I.p` tasks_
        , "others_can_add_tasks"          `I.p` others_can_add_tasks_
        , "others_can_mark_tasks_as_done" `I.p` others_can_mark_tasks_as_done_
        ]

instance AT.FromJSON InputChecklist where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputChecklist" -> parseInputChecklist v
      _                -> mempty
    
    where
      parseInputChecklist :: A.Value -> AT.Parser InputChecklist
      parseInputChecklist = A.withObject "InputChecklist" $ \o -> do
        title_                         <- o A..:?  "title"
        tasks_                         <- o A..:?  "tasks"
        others_can_add_tasks_          <- o A..:?  "others_can_add_tasks"
        others_can_mark_tasks_as_done_ <- o A..:?  "others_can_mark_tasks_as_done"
        pure $ InputChecklist
          { title                         = title_
          , tasks                         = tasks_
          , others_can_add_tasks          = others_can_add_tasks_
          , others_can_mark_tasks_as_done = others_can_mark_tasks_as_done_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputChecklist where
  toJSON InputChecklist
    { title                         = title_
    , tasks                         = tasks_
    , others_can_add_tasks          = others_can_add_tasks_
    , others_can_mark_tasks_as_done = others_can_mark_tasks_as_done_
    }
      = A.object
        [ "@type"                         A..= AT.String "inputChecklist"
        , "title"                         A..= title_
        , "tasks"                         A..= tasks_
        , "others_can_add_tasks"          A..= others_can_add_tasks_
        , "others_can_mark_tasks_as_done" A..= others_can_mark_tasks_as_done_
        ]

defaultInputChecklist :: InputChecklist
defaultInputChecklist =
  InputChecklist
    { title                         = Nothing
    , tasks                         = Nothing
    , others_can_add_tasks          = Nothing
    , others_can_mark_tasks_as_done = Nothing
    }

