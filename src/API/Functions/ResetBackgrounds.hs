-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetBackgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResetBackgrounds = 
 ResetBackgrounds -- deriving (Show)

instance T.ToJSON ResetBackgrounds where
 toJSON (ResetBackgrounds {  }) =
  A.object [ "@type" A..= T.String "resetBackgrounds" ]
-- resetBackgrounds ResetBackgrounds 

