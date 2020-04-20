-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntity as TextEntity

--main = putStrLn "ok"

data TextEntities = 
 TextEntities { entities :: [TextEntity.TextEntity] }  -- deriving (Show)

instance T.ToJSON TextEntities where
 toJSON (TextEntities { entities = entities }) =
  A.object [ "@type" A..= T.String "textEntities", "entities" A..= entities ]
-- textEntities TextEntities  { entities :: [TextEntity.TextEntity] } 

