module TD.Query.AnswerWebAppQuery
  (AnswerWebAppQuery(..)
  , defaultAnswerWebAppQuery
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult

-- | Sets the result of interaction with a Web App and sends corresponding message on behalf of the user to the chat from which the query originated; for bots only. Returns 'TD.Data.SentWebAppMessage.SentWebAppMessage'
data AnswerWebAppQuery
  = AnswerWebAppQuery
    { web_app_query_id :: Maybe T.Text                                        -- ^ Identifier of the Web App query
    , result           :: Maybe InputInlineQueryResult.InputInlineQueryResult -- ^ The result of the query
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerWebAppQuery where
  shortShow
    AnswerWebAppQuery
      { web_app_query_id = web_app_query_id_
      , result           = result_
      }
        = "AnswerWebAppQuery"
          ++ I.cc
          [ "web_app_query_id" `I.p` web_app_query_id_
          , "result"           `I.p` result_
          ]

instance AT.ToJSON AnswerWebAppQuery where
  toJSON
    AnswerWebAppQuery
      { web_app_query_id = web_app_query_id_
      , result           = result_
      }
        = A.object
          [ "@type"            A..= AT.String "answerWebAppQuery"
          , "web_app_query_id" A..= web_app_query_id_
          , "result"           A..= result_
          ]

defaultAnswerWebAppQuery :: AnswerWebAppQuery
defaultAnswerWebAppQuery =
  AnswerWebAppQuery
    { web_app_query_id = Nothing
    , result           = Nothing
    }

