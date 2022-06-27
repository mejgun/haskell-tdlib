{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AnswerWebAppQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult
import qualified Utils as U

-- |
-- Sets the result of interaction with a Web App and sends corresponding message on behalf of the user to the chat from which the query originated; for bots only
data AnswerWebAppQuery = AnswerWebAppQuery
  { -- | The result of the query
    result :: Maybe InputInlineQueryResult.InputInlineQueryResult,
    -- | Identifier of the Web App query
    web_app_query_id :: Maybe String
  }
  deriving (Eq)

instance Show AnswerWebAppQuery where
  show
    AnswerWebAppQuery
      { result = result_,
        web_app_query_id = web_app_query_id_
      } =
      "AnswerWebAppQuery"
        ++ U.cc
          [ U.p "result" result_,
            U.p "web_app_query_id" web_app_query_id_
          ]

instance T.ToJSON AnswerWebAppQuery where
  toJSON
    AnswerWebAppQuery
      { result = result_,
        web_app_query_id = web_app_query_id_
      } =
      A.object
        [ "@type" A..= T.String "answerWebAppQuery",
          "result" A..= result_,
          "web_app_query_id" A..= web_app_query_id_
        ]
