{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PollType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- | Describes the type of a poll
data PollType
  = -- | A regular poll @allow_multiple_answers True, if multiple answer options can be chosen simultaneously
    PollTypeRegular
      { -- |
        allow_multiple_answers :: Maybe Bool
      }
  | -- | A poll in quiz mode, which has exactly one correct answer option and can be answered only once
    PollTypeQuiz
      { -- | Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds; empty for a yet unanswered poll
        explanation :: Maybe FormattedText.FormattedText,
        -- | 0-based identifier of the correct answer option; -1 for a yet unanswered poll
        correct_option_id :: Maybe Int
      }
  deriving (Eq)

instance Show PollType where
  show
    PollTypeRegular
      { allow_multiple_answers = allow_multiple_answers_
      } =
      "PollTypeRegular"
        ++ U.cc
          [ U.p "allow_multiple_answers" allow_multiple_answers_
          ]
  show
    PollTypeQuiz
      { explanation = explanation_,
        correct_option_id = correct_option_id_
      } =
      "PollTypeQuiz"
        ++ U.cc
          [ U.p "explanation" explanation_,
            U.p "correct_option_id" correct_option_id_
          ]

instance T.FromJSON PollType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pollTypeRegular" -> parsePollTypeRegular v
      "pollTypeQuiz" -> parsePollTypeQuiz v
      _ -> mempty
    where
      parsePollTypeRegular :: A.Value -> T.Parser PollType
      parsePollTypeRegular = A.withObject "PollTypeRegular" $ \o -> do
        allow_multiple_answers_ <- o A..:? "allow_multiple_answers"
        return $ PollTypeRegular {allow_multiple_answers = allow_multiple_answers_}

      parsePollTypeQuiz :: A.Value -> T.Parser PollType
      parsePollTypeQuiz = A.withObject "PollTypeQuiz" $ \o -> do
        explanation_ <- o A..:? "explanation"
        correct_option_id_ <- o A..:? "correct_option_id"
        return $ PollTypeQuiz {explanation = explanation_, correct_option_id = correct_option_id_}
  parseJSON _ = mempty

instance T.ToJSON PollType where
  toJSON
    PollTypeRegular
      { allow_multiple_answers = allow_multiple_answers_
      } =
      A.object
        [ "@type" A..= T.String "pollTypeRegular",
          "allow_multiple_answers" A..= allow_multiple_answers_
        ]
  toJSON
    PollTypeQuiz
      { explanation = explanation_,
        correct_option_id = correct_option_id_
      } =
      A.object
        [ "@type" A..= T.String "pollTypeQuiz",
          "explanation" A..= explanation_,
          "correct_option_id" A..= correct_option_id_
        ]
