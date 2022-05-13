{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddSavedAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list
data AddSavedAnimation = AddSavedAnimation
  { -- | The animation file to be added. Only animations known to the server (i.e., successfully sent via a message) can be added to the list
    animation :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show AddSavedAnimation where
  show
    AddSavedAnimation
      { animation = animation_
      } =
      "AddSavedAnimation"
        ++ U.cc
          [ U.p "animation" animation_
          ]

instance T.ToJSON AddSavedAnimation where
  toJSON
    AddSavedAnimation
      { animation = animation_
      } =
      A.object
        [ "@type" A..= T.String "addSavedAnimation",
          "animation" A..= animation_
        ]
