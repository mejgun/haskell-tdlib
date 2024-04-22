module TD.Data.PollType
  (PollType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Describes the type of poll
data PollType
  = PollTypeRegular -- ^ A regular poll
    { allow_multiple_answers :: Maybe Bool -- ^ True, if multiple answer options can be chosen simultaneously
    }
  | PollTypeQuiz -- ^ A poll in quiz mode, which has exactly one correct answer option and can be answered only once
    { correct_option_id :: Maybe Int                         -- ^ 0-based identifier of the correct answer option; -1 for a yet unanswered poll
    , explanation       :: Maybe FormattedText.FormattedText -- ^ Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds; empty for a yet unanswered poll
    }
  deriving (Eq, Show)

instance I.ShortShow PollType where
  shortShow PollTypeRegular
    { allow_multiple_answers = allow_multiple_answers_
    }
      = "PollTypeRegular"
        ++ I.cc
        [ "allow_multiple_answers" `I.p` allow_multiple_answers_
        ]
  shortShow PollTypeQuiz
    { correct_option_id = correct_option_id_
    , explanation       = explanation_
    }
      = "PollTypeQuiz"
        ++ I.cc
        [ "correct_option_id" `I.p` correct_option_id_
        , "explanation"       `I.p` explanation_
        ]

instance AT.FromJSON PollType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollTypeRegular" -> parsePollTypeRegular v
      "pollTypeQuiz"    -> parsePollTypeQuiz v
      _                 -> mempty
    
    where
      parsePollTypeRegular :: A.Value -> AT.Parser PollType
      parsePollTypeRegular = A.withObject "PollTypeRegular" $ \o -> do
        allow_multiple_answers_ <- o A..:?  "allow_multiple_answers"
        pure $ PollTypeRegular
          { allow_multiple_answers = allow_multiple_answers_
          }
      parsePollTypeQuiz :: A.Value -> AT.Parser PollType
      parsePollTypeQuiz = A.withObject "PollTypeQuiz" $ \o -> do
        correct_option_id_ <- o A..:?  "correct_option_id"
        explanation_       <- o A..:?  "explanation"
        pure $ PollTypeQuiz
          { correct_option_id = correct_option_id_
          , explanation       = explanation_
          }
  parseJSON _ = mempty

instance AT.ToJSON PollType where
  toJSON PollTypeRegular
    { allow_multiple_answers = allow_multiple_answers_
    }
      = A.object
        [ "@type"                  A..= AT.String "pollTypeRegular"
        , "allow_multiple_answers" A..= allow_multiple_answers_
        ]
  toJSON PollTypeQuiz
    { correct_option_id = correct_option_id_
    , explanation       = explanation_
    }
      = A.object
        [ "@type"             A..= AT.String "pollTypeQuiz"
        , "correct_option_id" A..= correct_option_id_
        , "explanation"       A..= explanation_
        ]

