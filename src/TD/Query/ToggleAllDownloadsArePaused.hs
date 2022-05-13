{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleAllDownloadsArePaused where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes pause state of all files in the file download list @are_paused Pass true to pause all downloads; pass false to unpause them
data ToggleAllDownloadsArePaused = ToggleAllDownloadsArePaused
  { -- |
    are_paused :: Maybe Bool
  }
  deriving (Eq)

instance Show ToggleAllDownloadsArePaused where
  show
    ToggleAllDownloadsArePaused
      { are_paused = are_paused_
      } =
      "ToggleAllDownloadsArePaused"
        ++ U.cc
          [ U.p "are_paused" are_paused_
          ]

instance T.ToJSON ToggleAllDownloadsArePaused where
  toJSON
    ToggleAllDownloadsArePaused
      { are_paused = are_paused_
      } =
      A.object
        [ "@type" A..= T.String "toggleAllDownloadsArePaused",
          "are_paused" A..= are_paused_
        ]
