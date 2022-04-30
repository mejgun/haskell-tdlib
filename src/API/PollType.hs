-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PollType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Describes the type of a poll
data PollType = 
 -- |
 -- 
 -- A regular poll 
 -- 
 -- __allow_multiple_answers__ True, if multiple answer options can be chosen simultaneously
 PollTypeRegular { allow_multiple_answers :: Maybe Bool }  |
 -- |
 -- 
 -- A poll in quiz mode, which has exactly one correct answer option and can be answered only once
 -- 
 -- __correct_option_id__ 0-based identifier of the correct answer option; -1 for a yet unanswered poll
 -- 
 -- __explanation__ Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds; empty for a yet unanswered poll
 PollTypeQuiz { explanation :: Maybe FormattedText.FormattedText, correct_option_id :: Maybe Int }  deriving (Eq)

instance Show PollType where
 show PollTypeRegular { allow_multiple_answers=allow_multiple_answers } =
  "PollTypeRegular" ++ U.cc [U.p "allow_multiple_answers" allow_multiple_answers ]

 show PollTypeQuiz { explanation=explanation, correct_option_id=correct_option_id } =
  "PollTypeQuiz" ++ U.cc [U.p "explanation" explanation, U.p "correct_option_id" correct_option_id ]

instance T.ToJSON PollType where
 toJSON PollTypeRegular { allow_multiple_answers = allow_multiple_answers } =
  A.object [ "@type" A..= T.String "pollTypeRegular", "allow_multiple_answers" A..= allow_multiple_answers ]

 toJSON PollTypeQuiz { explanation = explanation, correct_option_id = correct_option_id } =
  A.object [ "@type" A..= T.String "pollTypeQuiz", "explanation" A..= explanation, "correct_option_id" A..= correct_option_id ]

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
    allow_multiple_answers <- o A..:? "allow_multiple_answers"
    return $ PollTypeRegular { allow_multiple_answers = allow_multiple_answers }

   parsePollTypeQuiz :: A.Value -> T.Parser PollType
   parsePollTypeQuiz = A.withObject "PollTypeQuiz" $ \o -> do
    explanation <- o A..:? "explanation"
    correct_option_id <- mconcat [ o A..:? "correct_option_id", readMaybe <$> (o A..: "correct_option_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PollTypeQuiz { explanation = explanation, correct_option_id = correct_option_id }
 parseJSON _ = mempty
