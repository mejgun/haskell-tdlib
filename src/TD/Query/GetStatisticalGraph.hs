module TD.Query.GetStatisticalGraph where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetStatisticalGraph -- ^ Loads an asynchronous or a zoomed in statistical graph
  = GetStatisticalGraph
    { chat_id :: Maybe Int    -- ^ Chat identifier
    , token   :: Maybe T.Text -- ^ The token for graph loading
    , x       :: Maybe Int    -- ^ X-value for zoomed in graph or 0 otherwise
    }
  deriving (Eq)

instance Show GetStatisticalGraph where
  show
    GetStatisticalGraph
      { chat_id = chat_id_
      , token   = token_
      , x       = x_
      }
        = "GetStatisticalGraph"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "token"   `I.p` token_
          , "x"       `I.p` x_
          ]

instance AT.ToJSON GetStatisticalGraph where
  toJSON
    GetStatisticalGraph
      { chat_id = chat_id_
      , token   = token_
      , x       = x_
      }
        = A.object
          [ "@type"   A..= AT.String "getStatisticalGraph"
          , "chat_id" A..= chat_id_
          , "token"   A..= token_
          , "x"       A..= x_
          ]
