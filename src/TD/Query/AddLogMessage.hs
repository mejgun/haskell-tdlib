module TD.Query.AddLogMessage
  (AddLogMessage(..)
  , defaultAddLogMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a message to TDLib internal log. Can be called synchronously. Returns 'TD.Data.Ok.Ok'
data AddLogMessage
  = AddLogMessage
    { verbosity_level :: Maybe Int    -- ^ The minimum verbosity level needed for the message to be logged; 0-1023
    , text            :: Maybe T.Text -- ^ Text of a message to log
    }
  deriving (Eq, Show)

instance I.ShortShow AddLogMessage where
  shortShow
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

defaultAddLogMessage :: AddLogMessage
defaultAddLogMessage =
  AddLogMessage
    { verbosity_level = Nothing
    , text            = Nothing
    }

