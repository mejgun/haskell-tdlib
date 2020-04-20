-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PollType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PollType = 
 PollTypeRegular { allow_multiple_answers :: Bool }  
 | PollTypeQuiz { correct_option_id :: Int }  -- deriving (Show)

instance T.ToJSON PollType where
 toJSON (PollTypeRegular { allow_multiple_answers = allow_multiple_answers }) =
  A.object [ "@type" A..= T.String "pollTypeRegular", "allow_multiple_answers" A..= allow_multiple_answers ]

 toJSON (PollTypeQuiz { correct_option_id = correct_option_id }) =
  A.object [ "@type" A..= T.String "pollTypeQuiz", "correct_option_id" A..= correct_option_id ]
-- pollTypeRegular PollType  { allow_multiple_answers :: Bool } 

-- pollTypeQuiz PollType  { correct_option_id :: Int } 

