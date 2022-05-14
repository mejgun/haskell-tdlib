{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Animations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified Utils as U

-- |
data Animations = -- | Represents a list of animations @animations List of animations
  Animations
  { -- |
    animations :: Maybe [Animation.Animation]
  }
  deriving (Eq)

instance Show Animations where
  show
    Animations
      { animations = animations_
      } =
      "Animations"
        ++ U.cc
          [ U.p "animations" animations_
          ]

instance T.FromJSON Animations where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "animations" -> parseAnimations v
      _ -> mempty
    where
      parseAnimations :: A.Value -> T.Parser Animations
      parseAnimations = A.withObject "Animations" $ \o -> do
        animations_ <- o A..:? "animations"
        return $ Animations {animations = animations_}
  parseJSON _ = mempty

instance T.ToJSON Animations where
  toJSON
    Animations
      { animations = animations_
      } =
      A.object
        [ "@type" A..= T.String "animations",
          "animations" A..= animations_
        ]
