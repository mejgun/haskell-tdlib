-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Animations where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Animation as Animation

data Animations = 
 Animations { animations :: Maybe [Animation.Animation] }  deriving (Show, Eq)

instance T.ToJSON Animations where
 toJSON (Animations { animations = animations }) =
  A.object [ "@type" A..= T.String "animations", "animations" A..= animations ]

instance T.FromJSON Animations where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animations" -> parseAnimations v
   _ -> mempty
  where
   parseAnimations :: A.Value -> T.Parser Animations
   parseAnimations = A.withObject "Animations" $ \o -> do
    animations <- o A..:? "animations"
    return $ Animations { animations = animations }