-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Animations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Animation as Animation

--main = putStrLn "ok"

data Animations = 
 Animations { animations :: [Animation.Animation] }  -- deriving (Show)

instance T.ToJSON Animations where
 toJSON (Animations { animations = animations }) =
  A.object [ "@type" A..= T.String "animations", "animations" A..= animations ]
-- animations Animations  { animations :: [Animation.Animation] } 

