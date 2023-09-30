{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputStoryAreas where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputStoryArea as InputStoryArea
import qualified Utils as U

-- |
data InputStoryAreas = -- | Contains a list of story areas to be added @areas List of 0-10 input story areas
  InputStoryAreas
  { -- |
    areas :: Maybe [InputStoryArea.InputStoryArea]
  }
  deriving (Eq)

instance Show InputStoryAreas where
  show
    InputStoryAreas
      { areas = areas_
      } =
      "InputStoryAreas"
        ++ U.cc
          [ U.p "areas" areas_
          ]

instance T.FromJSON InputStoryAreas where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputStoryAreas" -> parseInputStoryAreas v
      _ -> mempty
    where
      parseInputStoryAreas :: A.Value -> T.Parser InputStoryAreas
      parseInputStoryAreas = A.withObject "InputStoryAreas" $ \o -> do
        areas_ <- o A..:? "areas"
        return $ InputStoryAreas {areas = areas_}
  parseJSON _ = mempty

instance T.ToJSON InputStoryAreas where
  toJSON
    InputStoryAreas
      { areas = areas_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryAreas",
          "areas" A..= areas_
        ]
