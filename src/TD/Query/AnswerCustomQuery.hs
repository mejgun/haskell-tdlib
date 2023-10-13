module TD.Query.AnswerCustomQuery(AnswerCustomQuery(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data AnswerCustomQuery -- ^ Answers a custom query; for bots only
  = AnswerCustomQuery
    { custom_query_id :: Maybe Int    -- ^ Identifier of a custom query
    , _data           :: Maybe T.Text -- ^ JSON-serialized answer to the query
    }
  deriving (Eq)

instance Show AnswerCustomQuery where
  show
    AnswerCustomQuery
      { custom_query_id = custom_query_id_
      , _data           = _data_
      }
        = "AnswerCustomQuery"
          ++ I.cc
          [ "custom_query_id" `I.p` custom_query_id_
          , "_data"           `I.p` _data_
          ]

instance AT.ToJSON AnswerCustomQuery where
  toJSON
    AnswerCustomQuery
      { custom_query_id = custom_query_id_
      , _data           = _data_
      }
        = A.object
          [ "@type"           A..= AT.String "answerCustomQuery"
          , "custom_query_id" A..= fmap I.writeInt64  custom_query_id_
          , "data"            A..= _data_
          ]
