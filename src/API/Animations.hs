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



instance T.FromJSON Animations where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animations" -> parseAnimations v
  where
   parseAnimations :: A.Value -> T.Parser Animations
   parseAnimations = A.withObject "Animations" $ \o -> do
    animations <- o A..: "animations"
    return $ Animations { animations = animations }