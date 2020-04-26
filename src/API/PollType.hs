-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PollType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the type of a poll
data PollType = 
 PollTypeRegular { allow_multiple_answers :: Maybe Bool }  
 | PollTypeQuiz { correct_option_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON PollType where
 toJSON (PollTypeRegular { allow_multiple_answers = allow_multiple_answers }) =
  A.object [ "@type" A..= T.String "pollTypeRegular", "allow_multiple_answers" A..= allow_multiple_answers ]

 toJSON (PollTypeQuiz { correct_option_id = correct_option_id }) =
  A.object [ "@type" A..= T.String "pollTypeQuiz", "correct_option_id" A..= correct_option_id ]

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
    correct_option_id <- mconcat [ o A..:? "correct_option_id", readMaybe <$> (o A..: "correct_option_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PollTypeQuiz { correct_option_id = correct_option_id }