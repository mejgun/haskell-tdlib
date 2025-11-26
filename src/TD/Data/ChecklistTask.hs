module TD.Data.ChecklistTask
  (ChecklistTask(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.MessageSender as MessageSender

data ChecklistTask
  = ChecklistTask -- ^ Describes a task in a checklist
    { _id             :: Maybe Int                         -- ^ Unique identifier of the task
    , text            :: Maybe FormattedText.FormattedText -- ^ Text of the task; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, Url, EmailAddress, Mention, Hashtag, Cashtag and PhoneNumber entities
    , completed_by    :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or chat that completed the task; may be null if the task isn't completed yet
    , completion_date :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the task was completed; 0 if the task isn't completed
    }
  deriving (Eq, Show)

instance I.ShortShow ChecklistTask where
  shortShow ChecklistTask
    { _id             = _id_
    , text            = text_
    , completed_by    = completed_by_
    , completion_date = completion_date_
    }
      = "ChecklistTask"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "text"            `I.p` text_
        , "completed_by"    `I.p` completed_by_
        , "completion_date" `I.p` completion_date_
        ]

instance AT.FromJSON ChecklistTask where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "checklistTask" -> parseChecklistTask v
      _               -> mempty
    
    where
      parseChecklistTask :: A.Value -> AT.Parser ChecklistTask
      parseChecklistTask = A.withObject "ChecklistTask" $ \o -> do
        _id_             <- o A..:?  "id"
        text_            <- o A..:?  "text"
        completed_by_    <- o A..:?  "completed_by"
        completion_date_ <- o A..:?  "completion_date"
        pure $ ChecklistTask
          { _id             = _id_
          , text            = text_
          , completed_by    = completed_by_
          , completion_date = completion_date_
          }
  parseJSON _ = mempty

