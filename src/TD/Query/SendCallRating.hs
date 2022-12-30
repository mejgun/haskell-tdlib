{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendCallRating where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallProblem as CallProblem
import qualified Utils as U

-- |
-- Sends a call rating
data SendCallRating = SendCallRating
  { -- | List of the exact types of problems with the call, specified by the user
    problems :: Maybe [CallProblem.CallProblem],
    -- | An optional user comment if the rating is less than 5
    comment :: Maybe String,
    -- | Call rating; 1-5
    rating :: Maybe Int,
    -- | Call identifier
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendCallRating where
  show
    SendCallRating
      { problems = problems_,
        comment = comment_,
        rating = rating_,
        call_id = call_id_
      } =
      "SendCallRating"
        ++ U.cc
          [ U.p "problems" problems_,
            U.p "comment" comment_,
            U.p "rating" rating_,
            U.p "call_id" call_id_
          ]

instance T.ToJSON SendCallRating where
  toJSON
    SendCallRating
      { problems = problems_,
        comment = comment_,
        rating = rating_,
        call_id = call_id_
      } =
      A.object
        [ "@type" A..= T.String "sendCallRating",
          "problems" A..= problems_,
          "comment" A..= comment_,
          "rating" A..= rating_,
          "call_id" A..= call_id_
        ]
