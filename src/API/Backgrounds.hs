-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Backgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Background as Background

--main = putStrLn "ok"

data Backgrounds = 
 Backgrounds { backgrounds :: [Background.Background] }  -- deriving (Show)

instance T.ToJSON Backgrounds where
 toJSON (Backgrounds { backgrounds = backgrounds }) =
  A.object [ "@type" A..= T.String "backgrounds", "backgrounds" A..= backgrounds ]
-- backgrounds Backgrounds  { backgrounds :: [Background.Background] } 

