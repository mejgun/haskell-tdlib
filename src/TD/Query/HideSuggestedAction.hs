module TD.Query.HideSuggestedAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.SuggestedAction as SuggestedAction

data HideSuggestedAction -- ^ Hides a suggested action
  = HideSuggestedAction
    { action :: Maybe SuggestedAction.SuggestedAction -- ^ Suggested action to hide
    }
  deriving (Eq)

instance Show HideSuggestedAction where
  show
    HideSuggestedAction
      { action = action_
      }
        = "HideSuggestedAction"
          ++ I.cc
          [ "action" `I.p` action_
          ]

instance AT.ToJSON HideSuggestedAction where
  toJSON
    HideSuggestedAction
      { action = action_
      }
        = A.object
          [ "@type"  A..= AT.String "hideSuggestedAction"
          , "action" A..= action_
          ]
