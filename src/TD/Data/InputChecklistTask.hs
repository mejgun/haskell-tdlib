module TD.Data.InputChecklistTask
  ( InputChecklistTask(..)    
  , defaultInputChecklistTask 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data InputChecklistTask
  = InputChecklistTask -- ^ Describes a task in a checklist to be sent
    { _id  :: Maybe Int                         -- ^ Unique identifier of the task; must be positive
    , text :: Maybe FormattedText.FormattedText -- ^ Text of the task; 1-getOption("checklist_task_text_length_max") characters without line feeds. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities
    }
  deriving (Eq, Show)

instance I.ShortShow InputChecklistTask where
  shortShow InputChecklistTask
    { _id  = _id_
    , text = text_
    }
      = "InputChecklistTask"
        ++ I.cc
        [ "_id"  `I.p` _id_
        , "text" `I.p` text_
        ]

instance AT.FromJSON InputChecklistTask where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputChecklistTask" -> parseInputChecklistTask v
      _                    -> mempty
    
    where
      parseInputChecklistTask :: A.Value -> AT.Parser InputChecklistTask
      parseInputChecklistTask = A.withObject "InputChecklistTask" $ \o -> do
        _id_  <- o A..:?  "id"
        text_ <- o A..:?  "text"
        pure $ InputChecklistTask
          { _id  = _id_
          , text = text_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputChecklistTask where
  toJSON InputChecklistTask
    { _id  = _id_
    , text = text_
    }
      = A.object
        [ "@type" A..= AT.String "inputChecklistTask"
        , "id"    A..= _id_
        , "text"  A..= text_
        ]

defaultInputChecklistTask :: InputChecklistTask
defaultInputChecklistTask =
  InputChecklistTask
    { _id  = Nothing
    , text = Nothing
    }

