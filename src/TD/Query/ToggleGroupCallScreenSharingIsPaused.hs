module TD.Query.ToggleGroupCallScreenSharingIsPaused(ToggleGroupCallScreenSharingIsPaused(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleGroupCallScreenSharingIsPaused -- ^ Pauses or unpauses screen sharing in a joined group call
  = ToggleGroupCallScreenSharingIsPaused
    { group_call_id :: Maybe Int  -- ^ Group call identifier
    , is_paused     :: Maybe Bool -- ^ Pass true to pause screen sharing; pass false to unpause it
    }
  deriving (Eq)

instance Show ToggleGroupCallScreenSharingIsPaused where
  show
    ToggleGroupCallScreenSharingIsPaused
      { group_call_id = group_call_id_
      , is_paused     = is_paused_
      }
        = "ToggleGroupCallScreenSharingIsPaused"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "is_paused"     `I.p` is_paused_
          ]

instance AT.ToJSON ToggleGroupCallScreenSharingIsPaused where
  toJSON
    ToggleGroupCallScreenSharingIsPaused
      { group_call_id = group_call_id_
      , is_paused     = is_paused_
      }
        = A.object
          [ "@type"         A..= AT.String "toggleGroupCallScreenSharingIsPaused"
          , "group_call_id" A..= group_call_id_
          , "is_paused"     A..= is_paused_
          ]
