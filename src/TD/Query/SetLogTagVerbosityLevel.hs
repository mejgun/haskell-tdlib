module TD.Query.SetLogTagVerbosityLevel(SetLogTagVerbosityLevel(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SetLogTagVerbosityLevel -- ^ Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
  = SetLogTagVerbosityLevel
    { tag                 :: Maybe T.Text -- ^ Logging tag to change verbosity level
    , new_verbosity_level :: Maybe Int    -- ^ New verbosity level; 1-1024
    }
  deriving (Eq)

instance Show SetLogTagVerbosityLevel where
  show
    SetLogTagVerbosityLevel
      { tag                 = tag_
      , new_verbosity_level = new_verbosity_level_
      }
        = "SetLogTagVerbosityLevel"
          ++ I.cc
          [ "tag"                 `I.p` tag_
          , "new_verbosity_level" `I.p` new_verbosity_level_
          ]

instance AT.ToJSON SetLogTagVerbosityLevel where
  toJSON
    SetLogTagVerbosityLevel
      { tag                 = tag_
      , new_verbosity_level = new_verbosity_level_
      }
        = A.object
          [ "@type"               A..= AT.String "setLogTagVerbosityLevel"
          , "tag"                 A..= tag_
          , "new_verbosity_level" A..= new_verbosity_level_
          ]
