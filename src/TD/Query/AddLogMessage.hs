module TD.Query.AddLogMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data AddLogMessage -- ^ Adds a message to TDLib internal log. Can be called synchronously
  = AddLogMessage
    { verbosity_level :: Maybe Int    -- ^ The minimum verbosity level needed for the message to be logged; 0-1023
    , text            :: Maybe T.Text -- ^ Text of a message to log
    }
  deriving (Eq)

instance Show AddLogMessage where
  show
    AddLogMessage
      { verbosity_level = verbosity_level_
      , text            = text_
      }
        = "AddLogMessage"
          ++ I.cc
          [ "verbosity_level" `I.p` verbosity_level_
          , "text"            `I.p` text_
          ]

instance AT.ToJSON AddLogMessage where
  toJSON
    AddLogMessage
      { verbosity_level = verbosity_level_
      , text            = text_
      }
        = A.object
          [ "@type"           A..= AT.String "addLogMessage"
          , "verbosity_level" A..= verbosity_level_
          , "text"            A..= text_
          ]
