{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendCallRating where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.CallProblem as CallProblem
import qualified Utils as U

-- |
-- Sends a call rating @call_id Call identifier @rating Call rating; 1-5 @comment An optional user comment if the rating is less than 5 @problems List of the exact types of problems with the call, specified by the user
data SendCallRating = SendCallRating
  { -- |
    problems :: Maybe [CallProblem.CallProblem],
    -- |
    comment :: Maybe String,
    -- |
    rating :: Maybe Int,
    -- |
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendCallRating where
  show
    SendCallRating
      { problems = problems,
        comment = comment,
        rating = rating,
        call_id = call_id
      } =
      "SendCallRating"
        ++ U.cc
          [ U.p "problems" problems,
            U.p "comment" comment,
            U.p "rating" rating,
            U.p "call_id" call_id
          ]

instance T.ToJSON SendCallRating where
  toJSON
    SendCallRating
      { problems = problems,
        comment = comment,
        rating = rating,
        call_id = call_id
      } =
      A.object
        [ "@type" A..= T.String "sendCallRating",
          "problems" A..= problems,
          "comment" A..= comment,
          "rating" A..= rating,
          "call_id" A..= call_id
        ]
