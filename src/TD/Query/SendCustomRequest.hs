module TD.Query.SendCustomRequest(SendCustomRequest(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SendCustomRequest -- ^ Sends a custom request; for bots only
  = SendCustomRequest
    { method     :: Maybe T.Text -- ^ The method name
    , parameters :: Maybe T.Text -- ^ JSON-serialized method parameters
    }
  deriving (Eq)

instance Show SendCustomRequest where
  show
    SendCustomRequest
      { method     = method_
      , parameters = parameters_
      }
        = "SendCustomRequest"
          ++ I.cc
          [ "method"     `I.p` method_
          , "parameters" `I.p` parameters_
          ]

instance AT.ToJSON SendCustomRequest where
  toJSON
    SendCustomRequest
      { method     = method_
      , parameters = parameters_
      }
        = A.object
          [ "@type"      A..= AT.String "sendCustomRequest"
          , "method"     A..= method_
          , "parameters" A..= parameters_
          ]
