{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveSavedAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Removes an animation from the list of saved animations @animation Animation file to be removed
data RemoveSavedAnimation = RemoveSavedAnimation
  { -- |
    animation :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show RemoveSavedAnimation where
  show
    RemoveSavedAnimation
      { animation = animation
      } =
      "RemoveSavedAnimation"
        ++ U.cc
          [ U.p "animation" animation
          ]

instance T.ToJSON RemoveSavedAnimation where
  toJSON
    RemoveSavedAnimation
      { animation = animation
      } =
      A.object
        [ "@type" A..= T.String "removeSavedAnimation",
          "animation" A..= animation
        ]
